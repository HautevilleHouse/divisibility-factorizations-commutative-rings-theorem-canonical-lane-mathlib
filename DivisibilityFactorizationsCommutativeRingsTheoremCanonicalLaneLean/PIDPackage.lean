import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DivisibilityFactorizationsCommutativeRingsTheoremCanonicalLaneLean.DivisibilityDomain

/-!
# Principal Ideal Domain Package
-/

namespace HautevilleHouse
namespace DivisibilityFactorizationsCommutativeRingsTheoremCanonicalLaneLean

structure PIDPackage (R : DivisibilityDomain) where
  principalIdeals : ∀ I : Set R.carrier, (∀ x y ∈ I, x = R.zero → y = R.zero) → (∃ a : R.carrier, I = {x | ∃ y : R.carrier, R.multiplication a y = x})

structure PIDEvidence {R : DivisibilityDomain} (P : PIDPackage R) where
  principalIdealsClosed : P.principalIdeals

def PIDClosed {R : DivisibilityDomain} (P : PIDPackage R) : Prop :=
  P.principalIdeals

theorem pid_closed_from_evidence {R : DivisibilityDomain} (P : PIDPackage R) (E : PIDEvidence P) :
    PIDClosed P := by
  exact E.principalIdealsClosed

end DivisibilityFactorizationsCommutativeRingsTheoremCanonicalLaneLean
end HautevilleHouse