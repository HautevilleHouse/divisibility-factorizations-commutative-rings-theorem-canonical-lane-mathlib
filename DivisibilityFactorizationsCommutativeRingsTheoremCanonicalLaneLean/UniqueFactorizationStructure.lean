import canonicalLaneMathlib.AdmissibleClass
import DivisibilityFactorizationsCommutativeRingsTheoremCanonicalLaneLean.GCDDomainStructure

namespace HautevilleHouse
namespace DivisibilityFactorizationsCommutativeRingsTheoremCanonicalLaneLean

structure UniqueFactorizationDomain (R : Type u) [CommRing R] (G : GCDDomain R) where
  irreducibleFactorization : ∀ a : R, a ≠ 0 → ¬ IsUnit a → ∃ (factors : List R), (∀ f ∈ factors, Irreducible f) ∧ a = factors.prod
  factorizationUnique : ∀ a : R, a ≠ 0 → ∀ (l1 l2 : List R), (∀ f ∈ l1, Irreducible f) → (∀ f ∈ l2, Irreducible f) → a = l1.prod → a = l2.prod → Multiset.ofList l1 = Multiset.ofList l2

structure UFDPackage {R : Type u} [CommRing R] {G : GCDDomain R} (U : UniqueFactorizationDomain R G) where
  factorizationExists : Prop
  factorizationUnique : Prop
  primeImpliesIrreducible : Prop
  irreducibleImpliesPrime : Prop

structure UFDEvidence {R : Type u} [CommRing R] {G : GCDDomain R} {U : UniqueFactorizationDomain R G} (P : UFDPackage U) where
  factorizationExistsClosed : P.factorizationExists
  factorizationUniqueClosed : P.factorizationUnique
  primeImpliesIrreducibleClosed : P.primeImpliesIrreducible
  irreducibleImpliesPrimeClosed : P.irreducibleImpliesPrime

def UFDClosed {R : Type u} [CommRing R] {G : GCDDomain R} {U : UniqueFactorizationDomain R G} (P : UFDPackage U) : Prop :=
  P.factorizationExists ∧ P.factorizationUnique ∧ P.primeImpliesIrreducible ∧ P.irreducibleImpliesPrime

theorem ufd_closed_from_evidence {R : Type u} [CommRing R] {G : GCDDomain R} {U : UniqueFactorizationDomain R G} (P : UFDPackage U) (E : UFDEvidence P) : UFDClosed P := by
  exact And.intro E.factorizationExistsClosed (And.intro E.factorizationUniqueClosed (And.intro E.primeImpliesIrreducibleClosed E.irreducibleImpliesPrimeClosed))

end DivisibilityFactorizationsCommutativeRingsTheoremCanonicalLaneLean
end HautevilleHouse
