import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DivisibilityFactorizationsCommutativeRingsTheoremCanonicalLaneLean.DivisibilityDomain
import HautevilleHouse.DivisibilityFactorizationsCommutativeRingsTheoremCanonicalLaneLean.FactorizationsPackage

/-!
# Unique Factorization Domain Package
-/

namespace HautevilleHouse
namespace DivisibilityFactorizationsCommutativeRingsTheoremCanonicalLaneLean

structure UFDPackage (R : DivisibilityDomain) where
  factorizations : FactorizationsPackage R
  ufdProperty : FactorizationsClosed factorizations

structure UFDEvidence {R : DivisibilityDomain} (U : UFDPackage R) where
  factorizationsClosed : FactorizationsClosed U.factorizations
  ufdPropertyClosed : U.ufdProperty

def UFDClosed {R : DivisibilityDomain} (U : UFDPackage R) : Prop :=
  U.ufdProperty

theorem ufd_closed_from_evidence {R : DivisibilityDomain} (U : UFDPackage R) (E : UFDEvidence U) :
    UFDClosed U := by
  exact E.ufdPropertyClosed

end DivisibilityFactorizationsCommutativeRingsTheoremCanonicalLaneLean
end HautevilleHouse