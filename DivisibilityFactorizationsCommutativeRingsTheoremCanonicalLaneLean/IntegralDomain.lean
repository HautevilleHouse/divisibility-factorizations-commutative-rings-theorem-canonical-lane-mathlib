import Mathlib.RingTheory.IntegralDomain

/-!
# Integral Domain Package
-/

namespace HautevilleHouse
namespace DivisibilityFactorizationsCommutativeRingsTheoremCanonicalLaneLean

structure IntegralDomainPackage where
  carrier : Type u
  ringStructure : CommRing carrier
  domainProperty : IsDomain carrier
  noZeroDivisors : Prop
  domainPropertyClosed : domainProperty
  noZeroDivisorsClosed : noZeroDivisors

def IntegralDomainClosed (D : IntegralDomainPackage) : Prop :=
  D.domainProperty ∧ D.noZeroDivisors

theorem integral_domain_closed_from_package (D : IntegralDomainPackage) : IntegralDomainClosed D := by
  exact And.intro D.domainPropertyClosed D.noZeroDivisorsClosed

end DivisibilityFactorizationsCommutativeRingsTheoremCanonicalLaneLean
end HautevilleHouse