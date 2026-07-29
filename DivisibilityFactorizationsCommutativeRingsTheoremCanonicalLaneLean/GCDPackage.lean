import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DivisibilityFactorizationsCommutativeRingsTheoremCanonicalLaneLean.DivisibilityDomain

/-!
# GCD Package
-/

namespace HautevilleHouse
namespace DivisibilityFactorizationsCommutativeRingsTheoremCanonicalLaneLean

structure GCDPackage (R : DivisibilityDomain) where
  gcd : R.carrier → R.carrier → R.carrier
  gcdDvdLeft : ∀ a b : R.carrier, ∃ q : R.carrier, R.multiplication (gcd a b) q = a
  gcdDvdRight : ∀ a b : R.carrier, ∃ q : R.carrier, R.multiplication (gcd a b) q = b
  gcdUniversal : ∀ a b d : R.carrier, (∃ q : R.carrier, R.multiplication d q = a) → (∃ q : R.carrier, R.multiplication d q = b) → (∃ q : R.carrier, R.multiplication d q = gcd a b)

structure GCDEvidence {R : DivisibilityDomain} (G : GCDPackage R) where
  gcdDvdLeftClosed : G.gcdDvdLeft
  gcdDvdRightClosed : G.gcdDvdRight
  gcdUniversalClosed : G.gcdUniversal

def GCDClosed {R : DivisibilityDomain} (G : GCDPackage R) : Prop :=
  G.gcdDvdLeft ∧ G.gcdDvdRight ∧ G.gcdUniversal

theorem gcd_closed_from_evidence {R : DivisibilityDomain} (G : GCDPackage R) (E : GCDEvidence G) : GCDClosed G := by
  exact And.intro E.gcdDvdLeftClosed (And.intro E.gcdDvdRightClosed E.gcdUniversalClosed)

end DivisibilityFactorizationsCommutativeRingsTheoremCanonicalLaneLean
end HautevilleHouse