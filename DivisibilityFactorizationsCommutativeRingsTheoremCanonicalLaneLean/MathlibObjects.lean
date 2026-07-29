import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Data.Int.Basic
import Mathlib.Algebra.GroupPower.Basic

namespace HautevilleHouse
namespace DivisibilityFactorizationsCommutativeRingsTheoremCanonicalLaneLean

structure DivisibilityAdmittedObject where
  ring : Type u
  ringStr : CommRing ring
  element : ring
  irreducibleFactorization : Prop
  conclusion : irreducibleFactorization

structure DivisibilityWitness (O : DivisibilityAdmittedObject) : Prop where
  factorList : List (O.ring)
  eachIrreducible : ∀ f ∈ factorList, Irreducible f
  productEqualToElement : (factorList.prod : O.ring) = O.element

def DivisibilityWitnessClosed (O : DivisibilityAdmittedObject) : Prop :=
  Nonempty (DivisibilityWitness O)

end DivisibilityFactorizationsCommutativeRingsTheoremCanonicalLaneLean
end HautevilleHouse
