# Algorithm

ref. chapter 8.2 <i>Learn Quantum Computing w/ Python and Q# - Kaiser,Granade</i>

Classically, to determine if a function is constant or balanced, we must learn the entire function (build its entire truth table).
With this algorithm we can solve this with a single call to the oracle $U_f$.

1. Prepare 2 qubits labeled control and target in $| 0 \rangle \otimes | 0 \rangle$ state
2. Apply operations to control and target to prepare $| + \rangle \otimes |-\rangle$ state
3. Apply oracle $U_f$ to this state, $U_f | x \rangle | y \rangle = |x\rangle |y \oplus f(x) \rangle$
4. Measure control in X-basis: function $f$ is constant if 0, balanced otherwise.


```qsharp
open Microsoft.Quantum.Intrinsic;
open Microsoft.Quantum.Diagnostics;
open Microsoft.Quantum.Measurement;

operation ApplyZeroOracle(control : Qubit, target : Qubit) : Unit {
}

operation ApplyOneOracle(control : Qubit, target : Qubit) : Unit {
    X(target);
}

operation ApplyIdOracle(control : Qubit, target : Qubit) : Unit {
    CNOT(control,target);
}

operation ApplyNotOracle(control : Qubit, target : Qubit) : Unit {
    X(control);
    CNOT(control,target);
    X(control);
}

operation CheckIfOracleIsBalanced(oracle : (( Qubit, Qubit ) => Unit)) : Bool {
    use control = Qubit();
    use target = Qubit();

    H(control);
    X(target);
    H(target);

    oracle(control, target);

    H(target);
    X(target);

    return MResetX(control) == One;
}

operation RunDeutschJozsaAlgorithm() : Unit {
    Fact(not CheckIfOracleIsBalanced(ApplyZeroOracle), "Test failed for zero oracle.");
    Fact(not CheckIfOracleIsBalanced(ApplyOneOracle), "Test failed for zero oracle.");
    Fact(CheckIfOracleIsBalanced(ApplyIdOracle), "Test failed for zero oracle.");
    Fact(CheckIfOracleIsBalanced(ApplyNotOracle), "Test failed for zero oracle.");

    Message("All tests passed.");
}
```




<ul><li>ApplyZeroOracle</li><li>ApplyOneOracle</li><li>ApplyIdOracle</li><li>ApplyNotOracle</li><li>CheckIfOracleIsBalanced</li><li>RunDeutschJozsaAlgorithm</li></ul>




```qsharp
%simulate RunDeutschJozsaAlgorithm
```

    All tests passed.





    ()


