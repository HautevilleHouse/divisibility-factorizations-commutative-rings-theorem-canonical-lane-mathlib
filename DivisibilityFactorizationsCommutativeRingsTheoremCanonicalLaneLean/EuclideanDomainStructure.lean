import canonicalLaneMathlib.AdmissibleClass
import DivisibilityFactorizationsCommutativeRingsTheoremCanonicalLaneLean.GCDDomainStructure
import DivisibilityFactorizationsCommutativeRingsTheoremCanonicalLaneLean.PrincipalIdealDomainBridge

namespace HautevilleHouse
namespace DivisibilityFactorizationsCommutativeRingsTheoremCanonicalLaneLean

structure EuclideanDomain (R : Type u) [CommRing R] (G : GCDDomain R) where
  euclideanFunction : R → ℕ
  divisionAlgorithm : ∀ a b : R, b ≠ 0 → ∃ q r : R, a = b * q + r ∧ (r = 0 ∨ euclideanFunction r < euclideanFunction b)

structure EDPackage {R : Type u} [CommRing R] {G : GCDDomain R} (E : EuclideanDomain R G) (P : PrincipalIdealDomain R G) where
  euclideanImpliesPid : Prop
  gcdViaEuclidean : Prop
  euclideanAlgorithmTerminates : Prop

structre EDEvidence {R : Type u} [CommRing R] {G : GCDDomain R} {E : EuclideanDomain R G} {P : PrincipalIdealDomain R G} (Pkg : EDPackage E P) where
  euclideanImpliesPidClosed : Pkg.euclideanImpliesPid
  gcdViaEuclideanClosed : Pkg.gcdViaEuclidean
  euclideanAlgorithmTerminatesClosed : Pkg.euclideanAlgorithmTerminates

def EDClosed {R : Type u} [CommRing R] {G : GCDDomain R} {E : EuclideanDomain R G} {P : PrincipalIdealDomain R G} (Pkg : EDPackage E P) : Prop :=
  Pkg.euclideanImpliesPid ∧ Pkg.gcdViaEuclidean ∧ Pkg.euclideanAlgorithmTerminates

theorem ed_closed_from_evidence {R : Type u} [CommRing R] {G : GCDDomain R} {E : EuclideanDomain R G} {P : PrincipalIdealDomain R G} (Pkg : EDPackage E P) (Ev : EDEvidence Pkg) : EDClosed Pkg := by
  exact And.intro Ev.euclideanImpliesPidClosed (And.intro Ev.gcdViaEuclideanClosed Ev.euclideanAlgorithmTerminatesClosed)

end DivisibilityFactorizationsCommutativeRingsTheoremCanonicalLaneLean
end HautevilleHouse
