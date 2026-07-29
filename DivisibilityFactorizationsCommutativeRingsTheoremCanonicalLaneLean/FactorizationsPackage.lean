import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityFactorizationsCommutativeRingsTheoremCanonicalLaneLean

structure FactorizationsPackage {D : DivisibilityPackage} where
  factorizationExistence : ∀ (a : D.ring), a ≠ 0 → ∃ (factors : List D.ring), (∀ f ∈ factors, Irreducible f) ∧ (a = List.prod factors)
  factorizationUniqueness : ∀ (a : D.ring), a ≠ 0 → ∀ (f1 f2 : List D.ring), (∀ f ∈ f1, Irreducible f) → (∀ f ∈ f2, Irreducible f) → (a = List.prod f1) → (a = List.prod f2) → (List.length f1 = List.length f2) ∧ (Multiset.ofList f1 = Multiset.ofList f2)
  factorizationExistenceTerm : factorizationExistence
  factorizationUniquenessTerm : factorizationUniqueness

structure FactorizationsEvidence {D : DivisibilityPackage} (F : FactorizationsPackage D) where
  factorizationExistenceClosed : F.factorizationExistence
  factorizationUniquenessClosed : F.factorizationUniqueness

def FactorizationsClosed {D : DivisibilityPackage} (F : FactorizationsPackage D) : Prop :=
  F.factorizationExistence ∧ F.factorizationUniqueness

theorem factorizations_closed_from_evidence {D : DivisibilityPackage} (F : FactorizationsPackage D) (E : FactorizationsEvidence F) :
    FactorizationsClosed F := by
  exact And.intro E.factorizationExistenceClosed E.factorizationUniquenessClosed

end DivisibilityFactorizationsCommutativeRingsTheoremCanonicalLaneLean
end HautevilleHouse