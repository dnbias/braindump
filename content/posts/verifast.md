+++
title = "VeriFast"
author = ["Daniel Biasiotto"]
date = 2022-05-03T03:23:00+02:00
tags = ["tool", "compsci"]
draft = false
+++

-   [Github Page of the project](https://github.com/verifast/verifast)
-   [VeriFast: Imperative Programs as Proofs]({{< relref "verifast_imperative_programs_as_proofs.md" >}})
-   [Verification of Imperative Programs: The VeriFast Approach]({{< relref "verification_of_imperative_programs_the_verifast_approach.md" >}})

A tool for modular formal verification (_static symbolic analysis_) of [Correctness]({{< relref "correctness.md" >}}) properties of single-threaded and multithreaded C and Java Programs, annotated with preconditions and postconditions written in [Separation Logic]({{< relref "separation_logic.md" >}}).


## Theoretical Syntax {#theoretical-syntax}

-   \\(\exists\\) and \\(\forall\\) can be defined as recursive `predicates`
-   a basic imperative language
-   the language has pointers


## Symbolic State {#symbolic-state}

\\((s,h,\pi)\\)

-   store
-   symbolic heap
-   pattern conditions


## Production - Consumption {#production-consumption}

1.  production of \\(a\\)
    -   instantiation of chunk
    -   we have an assumption
2.  consumption of \\(a\\)
    -   removal of chunk
    -   we prove the assumption

\\[\text{produce}(h,s,\pi,a,Q) =
\begin{cases}
\pi,s,h' \vdash\_{\text{SMT}} a \text{ with }h\perp h'\\\\
Q (s, h \uplus h', \pi') \text{ with }\pi \subseteq \pi'
\end{cases}\\]

\\[\text{consume}(h,s,\pi,a,Q) =
\begin{cases}
\pi,s,h' \vdash\_{\text{SMT}} a \text{ with }h = h' \uplus h''\\\\
Q (s, h'', \pi') \text{ with }\pi \subseteq \pi'
\end{cases}\\]

Then these are used by 2 routines:

-   `verify(h,s,$\pi$,f(e),Q) where $f(x)$ requires $A_{1}$; ensures $A_{2}$;`
-   `valid($f(x)$ requires $A_{1}$; ensures $A_{2}$; $\{\overline{s}\}$)`


## Branches {#branches}

Happens in 2 cases:

1.  there is an `if` statement
2.  there is an `heap` allocation
    -   there is the case where the allocation does not succeed


## Examples {#examples}

No preconditions are `true`, empty heap is `emp`

```C
struct account
{
    int balance;
};

struct account *create_account()
/*@ requires true;
     ensures malloc_block_account(result) &*&
              result->balance |-> 0;
@*/
{
    struct account *myAccount = malloc(sizeof(struct account));
    if (myAccount == 0) abort();
    myAccount->balance = 0;
    return myAccount;
}

void account_set_balance(struct account *myAccount, int newBalance)
//@ requires myAccount->balance |-> _;
//@ ensures  myAccount->balance |-> newBalance;
{
    myAccount->balance = newBalance;
}

void account_deposit(struct account *myAccount, int amount)
//@ requires myAccount->balance |-> ?balance;
//@ ensures  myAccount->balance |-> (balance + amount);
{
    myAccount->balance += amount;
}
```

Here we use a ghost variable `value` using _pattern matching_

```C
int account_get_balance(struct account *myAccount)
//@ requires myAccount->balance |-> ?value;
//@ ensures result == value &*&
//@         myAccount->balance |-> value;
{
    return myAccount->balance;
}

void account_dispose(struct account *myAccount)
//@ requires malloc_block_account(myAccount) &*&
//@          myAccount->balance |-> _;
//@ ensures  emp;
{
    free(myAccount);
}
```

`predicates` are abbreviations

```C
/*@
predicate account_pred(struct account *myAccount, int theLimit, int theBalance) =
    myAccount->limit |-> theLimit &*& myAccount->balance |-> theBalance &*&
    malloc_block_account(myAccount);
@*/

int account_get_balance(struct account *myAccount)
//@ requires account_pred(myAccount, ?limit, ?balance);
//@ ensures  account_pred(myAccount, limit, balance) &*& result == balance;
{
   //@ open account_pred(myAccount, limit, balance);
    return myAccount->balance;
    //@ close account_pred(myAccount, limit, balance);
}
```