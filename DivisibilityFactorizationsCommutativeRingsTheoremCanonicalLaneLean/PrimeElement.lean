import DivisibilityFactorizationsCommutativeRingsTheoremCanonicalLaneLean.IntegralDomain

/-!
# Prime Element Package
-/

namespace HautevilleHouse
namespace DivisibilityFactorizationsCommutativeRingsTheoremCanonicalLaneLean

structure PrimeElementPackage {D : IntegralDomainPackage} where
  element : D.carrier
  isPrime : Prop
  irreducibleImplication : Prop
  primeImpliesIrreducible : isPrime → irreducibleImplication

def PrimeElementClosed {D : IntegralDomainPackage} (P : PrimeElementPackage D) : Prop :=
  P.isPrime ∧ P.irreducibleImplication

theorem prime_element_closed {D : IntegralDomainPackage} (P : PrimeElementPackage D) (h : P.isPrime) : PrimeElementClosed P := by
  exact And.intro h (P.primeImpliesIrreducible h)

end DivisibilityFactorizationsCommutativeRingsTheoremCanonicalLaneLean
end HautevilleHouse