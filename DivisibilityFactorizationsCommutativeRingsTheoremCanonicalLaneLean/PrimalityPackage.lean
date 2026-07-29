import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DivisibilityFactorizationsCommutativeRingsTheoremCanonicalLaneLean.DivisibilityDomain

/-!
# Primality Package
-/

namespace HautevilleHouse
namespace DivisibilityFactorizationsCommutativeRingsTheoremCanonicalLaneLean

structure PrimalityPackage (R : DivisibilityDomain) where
  primeElements : Set R.carrier
  primeImpliesIrreducible : ∀ p : R.carrier, p ∈ primeElements → p ∈ irreducibleElements
  euclidsLemma : ∀ p a b : R.carrier, p ∈ primeElements → R.multiplication p ∣ R.multiplication a b → (p ∣ a) ∨ (p ∣ b)
ic where
  irreducibleElements : Set R.carrier := {x | ∀ a b : R.carrier, R.multiplication x = R.multiplication a b → R.isUnit a ∨ R.isUnit b}
  isUnit : R.carrier → Prop := λ u => ∃ v : R.carrier, R.multiplication u v = R.one

structure PrimalityEvidence {R : DivisibilityDomain} (P : PrimalityPackage R) where
  primeImpliesIrreducibleClosed : P.primeImpliesIrreducible
  euclidsLemmaClosed : P.euclidsLemma

def PrimalityClosed {R : DivisibilityDomain} (P : PrimalityPackage R) : Prop :=
  P.primeImpliesIrreducible ∧ P.euclidsLemma

theorem primality_closed_from_evidence {R : DivisibilityDomain} (P : PrimalityPackage R) (E : PrimalityEvidence P) :
    PrimalityClosed P := by
  exact And.intro E.primeImpliesIrreducibleClosed E.euclidsLemmaClosed

end DivisibilityFactorizationsCommutativeRingsTheoremCanonicalLaneLean
end HautevilleHouse