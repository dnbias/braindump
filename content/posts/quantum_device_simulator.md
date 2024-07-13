+++
title = "Quantum Device Simulator"
author = ["Daniel Biasiotto"]
date = 2022-05-05T23:11:00+02:00
tags = ["compsci"]
draft = false
+++

-   Tags: [Quantum Computing]({{< relref "quantum_computing.md" >}}), [Python]({{< relref "20210328164122-python.md" >}})
-   Source: [Learn Quantum Computing with Python and Q#]({{< relref "learn_quantum_computing_with_python_and_q.md" >}})


## Interface {#interface}

```python
from abc import ABCMeta, abstractmethod
from contextlib import contextmanager

class Qubit(metaclass=ABCMeta):
    @abstractmethod
    def h(self): pass

    @abstractmethod
    def x(self): pass

    @abstractmethod
    def ry(self, angle: float): pass

    @abstractmethod
    def measure(self) -> bool: pass

    @abstractmethod
    def reset(self): pass

class QuantumDevice(metaclass=ABCMeta):
    @abstractmethod
    def allocate_qubit(self) -> Qubit:
        pass

    @abstractmethod
    def deallocate_qubit(self, qubit: Qubit):
        pass

    @contextmanager
    def using_qubit(self):
        qubit = self.allocate_qubit()
        try:
            yield qubit
        finally:
            qubit.reset()
            self.deallocate_qubit(qubit)
```


## Simulator {#simulator}

```python
from interface import QuantumDevice, Qubit
import qutip as qt
from qutip.qip.operations import hadamard_transform
import numpy as np
from typing import List

KET_0 = qt.basis(2, 0)
H = hadamard_transform()

class SimulatedQubit(Qubit):
    qubit_id: int
    parent: "Simulator"

    def __init__(self, parent_simulator: "Simulator", id: int):
        self.qubit_id = id
        self.parent = parent_simulator

    def h(self) -> None:
        self.parent._apply(H, [self.qubit_id])

    def ry(self, angle: float) -> None:
        self.parent._apply(qt.ry(angle), [self.qubit_id])

    def x(self) -> None:
        self.parent._apply(qt.sigmax(), [self.qubit_id])

    def measure(self) -> bool:
        projectors = [
            qt.circuit.gate_expand_1toN(
                qt.basis(2, outcome) * qt.basis(2, outcome).dag(),
                self.parent.capacity,
                self.qubit_id
            )
            for outcome in (0, 1)
        ]
        post_measurement_states = [
            projector * self.parent.register_state
            for projector in projectors
        ]
        probabilities = [
            post_measurement_state.norm() ** 2
            for post_measurement_state in post_measurement_states
        ]
        sample = np.random.choice([0, 1], p=probabilities)
        self.parent.register_state = post_measurement_states[sample].unit()
        return bool(sample)

    def reset(self) -> None:
        if self.measure(): self.x()

class Simulator(QuantumDevice):
    capacity: int
    available_qubits: List[SimulatedQubit]
    register_state: qt.Qobj
    def __init__(self, capacity=3):
        self.capacity = capacity
        self.available_qubits = [
            SimulatedQubit(self, idx)
            for idx in range(capacity)
        ]
        self.register_state = qt.tensor(
            *[
                qt.basis(2, 0)
                for _ in range(capacity)
            ]
        )
    def allocate_qubit(self) -> SimulatedQubit:
        if self.available_qubits:
            return self.available_qubits.pop()

    def deallocate_qubit(self, qubit: SimulatedQubit):
        self.available_qubits.append(qubit)

    def _apply(self, unitary: qt.Qobj, ids: List[int]):
        if len(ids) == 1:
            matrix = qt.circuit.gate_expand_1toN(
                unitary, self.capacity, ids[0]
            )
        else:
            raise ValueError("Only single-qubit unitary matrices are supported.")

        self.register_state = matrix * self.register_state
```
