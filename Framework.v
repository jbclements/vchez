From vchez Require Export Definitions.
From TLC Require Import LibLN.
From TLC Require Import LibReflect.
From Coq Require Export List.

Hint Constructors s_term : core.
Hint Constructors t_term : core.

(* Properties of local closure *)
Lemma s_term_abs_to_body : forall ts,
  s_term (s_trm_abs ts) -> s_body ts.
Proof.
  intros. unfold s_body. inversion* H. Qed.

Lemma t_term_abs_to_body : forall ts,
  t_term (t_trm_abs ts) -> t_body ts.
Proof.
  intros. unfold t_body. inversion* H. Qed.

Lemma s_body_to_term_abs : forall ts,
  s_body ts -> s_term (s_trm_abs ts).
Proof.
  intros. inversion* H. Qed.

Lemma t_body_to_term_abs : forall ts,
  t_body ts -> t_term (t_trm_abs ts).
Proof.
  intros. inversion* H. Qed.

Hint Resolve s_term_abs_to_body 
             t_term_abs_to_body 
             s_body_to_term_abs
             t_body_to_term_abs.

Lemma s_subst_id : forall t x u,
  x \notin s_fv t -> s_subst x u t = t.
Proof.
  intros. induction t; simpls; f_equal~; eauto.
  induction ts; simpls. reflexivity.
  - apply notin_union in H. destruct H. rewrite IHts.
    + f_equal~. admit.
    + apply H0.
  - admit.
  - unfold notin in H. rewrite in_singleton in H.   
    + rewrite var_compare_eq. rewrite if_isTrue.
      unfold not in H. admit.
Admitted.


     
    
    

(*
To Prove:
  Unique Eval Contexts:
    term t -> decomp t ec1 -> decomp t ec2 -> ec1 = ec2
  
  
  
  *)







