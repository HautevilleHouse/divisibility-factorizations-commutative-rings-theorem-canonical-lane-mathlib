import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityFactorizationsCommutativeRingsTheoremCanonicalLaneLean

structure DivisibilitySpace where
  carrier : Type
  addition : carrier → carrier → carrier
  multiplication : carrier → carrier → carrier
  zero : carrier
  one : carrier
  ringAxioms : Prop

structure DivisibilityAdmittedObject where
  dspace : DivisibilitySpace
  integralDomain : Prop
  factorizationExistence : Prop
  factorizationUniqueness : Prop
  conclusion : factorizationExistence ∧ factorizationUniqueness

structure DivisibilityEndgameState where
  object : DivisibilityAdmittedObject

def DivisibilityWitnessClosed (O : DivisibilityAdmittedObject) : Prop :=
  O.factorizationExistence ∧ O.factorizationUniqueness

end DivisibilityFactorizationsCommutativeRingsTheoremCanonicalLaneLean
end HautevilleHouse
