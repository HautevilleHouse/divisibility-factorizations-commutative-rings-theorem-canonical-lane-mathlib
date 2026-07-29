import canonicalLaneMathlib.AdmissibleClass
import DivisibilityFactorizationsCommutativeRingsTheoremCanonicalLaneLean.GCDDomainStructure
import DivisibilityFactorizationsCommutativeRingsTheoremCanonicalLaneLean.UniqueFactorizationStructure

namespace HautevilleHouse
namespace DivisibilityFactorizationsCommutativeRingsTheoremCanonicalLaneLean

structure PrincipalIdealDomain (R : Type u) [CommRing R] (G : GCDDomain R) where
  isPrincipal : ∀ I : Ideal R, I.IsPrincipal

structure PIDPackage {R : Type u} [CommRing R] {G : GCDDomain R} (P : PrincipalIdealDomain R G) (U : UniqueFactorizationDomain R G) where
  pidImpliesUfd : Prop
  ufdAndBezoutImpliesPid : Prop
  pidAndBezout : Prop

structure PIDEvidence {R : Type u} [CommRing R] {G : GCDDomain R} {P : PrincipalIdealDomain R G} {U : UniqueFactorizationDomain R G} (Pkg : PIDPackage P U) where
  pidImpliesUfdClosed : Pkg.pidImpliesUfd
  ufdAndBezoutImpliesPidClosed : Pkg.ufdAndBezoutImpliesPid
  pidAndBezoutClosed : Pkg.pidAndBezout

def PIDClosed {R : Type u} [CommRing R] {G : GCDDomain R} {P : PrincipalIdealDomain R G} {U : UniqueFactorizationDomain R G} (Pkg : PIDPackage P U) : Prop :=
  Pkg.pidImpliesUfd ∧ Pkg.ufdAndBezoutImpliesPid ∧ Pkg.pidAndBezout

theorem pid_closed_from_evidence {R : Type u} [CommRing R] {G : GCDDomain R} {P : PrincipalIdealDomain R G} {U : UniqueFactorizationDomain R G} (Pkg : PIDPackage P U) (E : PIDEvidence Pkg) : PIDClosed Pkg := by
  exact And.intro E.pidImpliesUfdClosed (And.intro E.ufdAndBezoutImpliesPidClosed E.pidAndBezoutClosed)

end DivisibilityFactorizationsCommutativeRingsTheoremCanonicalLaneLean
end HautevilleHouse
