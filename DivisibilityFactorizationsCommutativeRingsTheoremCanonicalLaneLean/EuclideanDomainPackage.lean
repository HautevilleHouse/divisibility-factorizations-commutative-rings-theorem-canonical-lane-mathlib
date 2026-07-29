import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DivisibilityFactorizationsCommutativeRingsTheoremCanonicalLaneLean.DivisibilityDomain

/-!
# Euclidean Domain Package
-/

namespace HautevilleHouse
namespace DivisibilityFactorizationsCommutativeRingsTheoremCanonicalLaneLean

structure EuclideanDomainPackage (R : DivisibilityDomain) where
  euclideanFunction : R.carrier → ℕ
  divisionAlgorithm : ∀ a b : R.carrier, b ≠ R.zero → ∃ q r : R.carrier,
    a = R.addition (R.multiplication q b) r ∧ (r = R.zero ∨ euclideanFunction r < euclideanFunction b)

structure EuclideanDomainEvidence {R : DivisibilityDomain} (E : EuclideanDomainPackage R) where
  divisionAlgorithmClosed : E.divisionAlgorithm

def EuclideanDomainClosed {R : DivisibilityDomain} (E : EuclideanDomainPackage R) : Prop :=
  E.divisionAlgorithm

theorem euclidean_domain_closed_from_evidence {R : DivisibilityDomain} (E : EuclideanDomainPackage R) (Ev : EuclideanDomainEvidence E) :
    EuclideanDomainClosed E := by
  exact Ev.divisionAlgorithmClosed

end DivisibilityFactorizationsCommutativeRingsTheoremCanonicalLaneLean
end HautevilleHouse