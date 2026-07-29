import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityFactorizationsCommutativeRingsTheoremCanonicalLaneLean

structure DivisibilityPackage where
  ring : Type u
  ringStructure : Semiring ring
  divisibilityRelation : ring → ring → Prop
  reflexivity : ∀ (a : ring), divisibilityRelation a a
  transitivity : ∀ (a b c : ring), divisibilityRelation a b → divisibilityRelation b c → divisibilityRelation a c
  unitMultiplicativity : ∀ (a u : ring), IsUnit u → divisibilityRelation a (a * u)

structure DivisibilityEvidence (D : DivisibilityPackage) where
  reflexivityClosed : D.reflexivity
  transitivityClosed : D.transitivity
  unitMultiplicativityClosed : D.unitMultiplicativity

def DivisibilityClosed (D : DivisibilityPackage) : Prop :=
  D.reflexivity ∧ D.transitivity ∧ D.unitMultiplicativity

theorem divisibility_closed_from_evidence (D : DivisibilityPackage) (E : DivisibilityEvidence D) :
    DivisibilityClosed D := by
  exact And.intro E.reflexivityClosed (And.intro E.transitivityClosed E.unitMultiplicativityClosed)

end DivisibilityFactorizationsCommutativeRingsTheoremCanonicalLaneLean
end HautevilleHouse