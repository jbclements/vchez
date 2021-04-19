From vchez Require Import Definitions.
From TLC Require Import LibLN.
From Coq Require Export List.

Hint Constructors term.

Notation "'[[' x '~>' y ']]' t" := (subst x (trm_var (fvar y)) t) (at level 69).

(* Properties of local closure *)
Lemma term_abs_to_body : forall ts,
  term (trm_abs ts) -> body ts.
Proof.
  intros. unfold body. inversion* H. Qed.

Lemma body_to_term_abs : forall ts,
  body ts -> term (trm_abs ts).
Proof.
  intros. inversion* H. Qed.

Hint Resolve term_abs_to_body body_to_term_abs.

(* Properties of open and subst *)

Lemma open_term : forall ts u,
  body ts -> term u -> term (open_each_term ts u).



Lemma subst_fresh : forall x t u,
  x \notin fv t -> (subst x u t) = t.
Proof.
  intros. induction t; simpls; f_equal~. 
Abort.








