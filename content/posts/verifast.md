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


### Predicates {#predicates}

`predicates` are abbreviations.

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


### Recursion {#recursion}

Code is a simple `stack` implementation.

```C
// stack(stack,count) == true if stack points to a count elements stack
/*@
predicate nodes(struct node *node, int count) =
    node == 0 ? count == 0 :
    0 < count &*&
    node->next |-> ?next &*& node->value |-> ?value &*&
    malloc_block_node{node} &*& nodes(next, count-1);
@*/
/*@
predicate pred_stack(struct stack *stack, int count) =
    stack-> |-> ?head &*&
    malloc_block_stack(stack) &*&
    0 <= count &*& nodes(head, count);
@*/
struct node {
  int value,
  node* next
};
struct stack {
    node* node
};


struct stack *create_stack()
//@ requires true
//@ ensures  pred_stack(result, 0);
{
    struct stack *stack = malloc(sizeof(struct stack));
    if (stack == 0) abort();
    stack->head = 0;
    //@ close nodes(stack->head, 0);
    //@ close pred_stack(stack, 0);
    return stack;
}
bool stack_is_empty(struct stack *stack)
//@ requires pred_stack(stack, ?count);
//@ ensures  result == (count == 0) &*& pred_stack(stack, count);

{
    //@ open pred_stack(stack, count);
    //@ open nodes(stack->head, count);
    struct node *head = stack->head;
    bool result = stack->head == 0;
    //@ close nodes(stack->head, count);
    //@ close pred_stack(stack, count);
    return result;
}

void stack_push(struct stack *stack, int value)
//@ requires pred_stack(stack, ?count);
//@ ensures  pred_stack(stack, count+1);
{
    //@ open pred_stack(stack, count);
    struct node *n = malloc(sizeof(stuct node));
    if (n == 0) abort();
    n->next = stack->head;
    n->value = value;
    stack->head = n;
    //@ close nodes(stack->head, count+1);
    //@ close pred_stack(stack, count+1);
}

int stack_pop(struct stack* stack)
// precondition: stack is non-empty
//@ requires pred_stack(stack, ?count) &*& count > 0;
//@ ensures  pred_stack(stack, count-1);
{
    //@ open pred_stack(stack, count);
    //@ open nodes(stack->head, count);
    struct node *head = stack->head;
    int result = head->value;
    stack->head = head->next;
    free(head);
    // close nodes(stack->head, count-1); not needed because of free(head)
    //@ close pred_stack(stack,count-1);
    return result;
}

void stack_dispose(struct stack* stack)
// precondition: stack is empty
//@ requires pred_stack(stack, 0);
//@ ensures  emp;
{
    //@ open pred_stack(stack, 0);
    //@ open nodes(stack->head, 0);
    free(stack); // no need to close
}

void nodes_dispose(struct node* n)
//@ requires nodes(n, _);
//@ ensures  emp;
{
    //@ open nodes(n, _);
    if (n!=0) {
        nodes_dispose(n->next);
        free(n); // no need to close
    }
}

void stack_dispose_iter(struct stack* stack)
//@ requires pred_stack(stack, _);
//@ ensures  emp;
{
    struct node *n = stack->head;
    //@ open pred_stack(stack,_);
    while (n != 0)
    //@ invariant nodes(n,_);
    {
        //@ open nodes(n,_);
        struct node *next = n->next;
        free(n);
        n = next;
    }
    //@ open nodes(n,_);
    free stack;
}

void stack_pop_n(struct stack* stack, int n)
//@ requires pred_stack(stack, ?count) &*& n >= 0 &*& n <= count;
//@ ensures pred_stack(stack, count-n);
{
    int i = 0;
    while (i<n)
    //@ invariant pred_stack(stack,count-i) &*& i <= n;
    {
        stack_pop(stack);
        i++;
    }
}
```

`open` and `close` are symmetric, and need to be called in order of depth of the predicate.
In case of recursion (ie. `nodes_dispose`) the simple requirement is the `induction hypothesis`.
In case of `while` the symbolic execution being always finite mean that it is only evaluetes the `true` and the `false` branches.


### Defining types and predicates that use them {#defining-types-and-predicates-that-use-them}

```C
/*@
inductive ints = ints_nil | ints_cons(int, ints);

predicate nodes(struct node *node, ints values) =
    node == 0 ?
        values == ints_nil
    :
        node->next |-> ?next &*&
        node->value |-> ?value &*&
        malloc_block_node(node) &*&
        nodes(next, ?tail_values) &*&
        values == ints_cons(value, tail_values);

predicate stack(struct stack *stack, ints values) =
    stack->head |-> ?head &*&
    malloc_block_stack(stack) &*&
    nodes(head, values);
@*/

struct stack *create_stack()
//@ requires true
//@ ensures stack(result, ints_nil);
{
    struct stack *stack = malloc(sizeof(struct stack));
    if (stack == 0 ) abort();
    //@ close nodes(0,ints_nil);
    //@ close stack(stack,ints_nil);
    return stack;
}

void stack_push(struct stack *stack, int value)
//@ requires stack(stack, ?values);
//@ ensures stack(stack, ints_cons(value, values));
{
    //@ open stack(stack, values);
    struct node *n = malloc(sizeof(struct node));
    if (n==0) abort();
    n->next = stack->head;
    n->value = value;
    stack->head = n;
    //@ close nodes(stack->head,  ints_cons(value,values));
    //@ close stack(stack, ints_cons(value,values));
}

int stack_pop(struct stack *stack)
//@ requires stack(stack, ints_cons(?value, ?values));
//@ ensures  stack(stack, values) &*& result == value;
{
    //@ open stack(stack, ints_cons(value, values));
    struct node *head = stack->head;
    //@ open nodes(head, ints_cons(value, values));
    int res = head->value;
    stack->head = head->next;
    free(head);
    //@ close stack(stack, values);
    return res;

}
```


### Fixpoint {#fixpoint}

`Pure` implementations of functions:

```C
/*@
fixpoint int ints_sum(ints values)
{
    switch(values)
    {
        case ints_nil: return 0;
        case ints_cons(value, tail): return value + ints_sum(tail);
    }
}
@*/
int nodes_get_sum(struct node *node)
//@ requires nodes(node, ?values);
//@ requires nodes(node, values) &*& result == ints_sum(values);
{
    //@ open nodes(node, values);
    int res = 0;
    if (node != 0)
    {
        int tailSum = nodes_get_sum(node->next);
        res = node->value + tailSum;
    }
    //@ close nodes(node, values);
    return res;
}
```


### Lemmi e lseg {#lemmi-e-lseg}

`lseg(first,last,count)` is `true` if there is a list starting from `first` (included) ending in `last` (excluded) of `count` elements

-   `last` can be `null`

Due to `stack` opening `nodes` we need a `lemma` to comunicate between `nodes` and `lseg`

-   it is basically an implication
-   that is an induction
    -   as in `Agda` the induction hypothesis is a <span class="underline">recursive call</span>

<!--listend-->

```C
/*@
predicate lseg(struct node *first, struct node *last, int count) =
    first == last ?
        count == 0
    :
        malloc_block_node(first) &*&
        0 < count &*& first |=0 &*&
        first->value |-> _ &*&
        first->next |-> ?next &*&
        lseg(next, last, count - 1);

lemma void nodes_to_lseg_lemma(struct node *first)
    requires nodes(first, ?count);
    ensures lseg(first, 0, count);
{
    open nodes(first, count);
    if(first != 0) {
        nodes_to_lseg_lemma(first->next);
    }
    close lseg(first, 0 , count);
}

lemma void lseg_to_nodes_lemma(struct node *first)
    requires lseg(first, 0, ?count);
    ensures nodes(first, count);
{
    open lseg(first, 0, count);
    if (first != 0) {
        lseg_to_nodes_lemma(first->next);
    }
    close nodes(first,count);
}

lemma void lseg_add_lemma(struct node *first)
    requires
        lseg(first, ?last, ?count) &*& last != 0 &*&
        last->value |-> _ &*&
        last->next |-> ?next &*&
        malloc_block_node(last) &*&
        lseg(next, 0, ?count0);
    ensures lseg(first, next, count+1) &*& lseg(next, 0, count0);
    {
        open lseg(first, last, count);
        if (first == last) {
            close lseg(nexn, next, 0);
        } else {
            lseg_add_lemma(first->next);
        }
        open lseg(next,0,count0);
        close lseg(next,0,count0);
        close lseg(first,next,count+1);
    }
@*/


int stack_get_count(struct stack *stack)
//@ requires stack(stack, ?count);
//@ ensures stack(stack, count) &*& result == count;
{
    //@ open stack(stack,count);
    struct node *head = stack->head;
    struct node *n = head;
    int i = 0;
    //@ nodes_to_lseg_lemma(head);
    //@ close lseg(head, head, 0);
    while (n != 0)
    //@ invariant lseg(head, n, i) &*& lseg(n, 0, count - i);
    {
        //@ open lseg(n , 0 , count - i);
        n = n->next;
        i++;
        //@  lseg_add_lemma(head);
    }
    //@ open lseg(0,0,_);
    //@ lseg_to_nodes_lemma(head
    //@ close stack(stack, count);
    return i;
}
```