import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityFactorizationsCommutativeRingsTheoremCanonicalLaneLean

structure GCDDomain (R : Type u) [CommRing R] where
  gcd : R → R → R
  gcd_dvd_left : ∀ a b : R, gcd a b ∣ a
  gcd_dvd_right : ∀ a b : R, gcd a b ∣ b
  gcd_is_greatest : ∀ a b d : R, d ∣ a → d ∣ b → d ∣ gcd a b

structure GCDDomainPackage (R : Type u) [CommRing R] (G : GCDDomain R) where
  bezoutIdentity : Prop
  lcmExists : Prop
  gcdAssociative : Prop
  domainProperties : Prop

structure GCDDomainEvidence {R : Type u} [CommRing R] {G : GCDDomain R} (P : GCDDomainPackage R G) where
  bezoutIdentityClosed : P.bezoutIdentity
  lcmExistsClosed : P.lcmExists
  gcdAssociativeClosed : P.gcdAssociative
  domainPropertiesClosed : P.domainProperties

def GCDDomainClosed {R : Type u} [CommRing R] {G : GCDDomain R} (P : GCDDomainPackage R G) : Prop :=
  P.bezoutIdentity ∧ P.lcmExists ∧ P.gcdAssociative ∧ P.domainProperties

theorem gcd_domain_closed_from_evidence {R : Type u} [CommRing R] {G : GCDDomain R} (P : GCDDomainPackage R G) (E : GCDDomainEvidence P) : GCDDomainClosed P := by
  exact And.intro E.bezoutIdentityClosed (And.intro E.lcmExistsClosed (And.intro E.gcdAssociativeClosed E.domainPropertiesClosed))

end DivisibilityFactorizationsCommutativeRingsTheoremCanonicalLaneLean
end HautevilleHouse
