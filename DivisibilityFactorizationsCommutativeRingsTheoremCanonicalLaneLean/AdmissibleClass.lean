import DivisibilityFactorizationsCommutativeRingsTheoremCanonicalLaneLean.DomainObjects

namespace HautevilleHouse
namespace DivisibilityFactorizationsCommutativeRingsTheoremCanonicalLaneLean

structure AdmissibleClass where
  object : DivisibilityAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  DivisibilityWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end DivisibilityFactorizationsCommutativeRingsTheoremCanonicalLaneLean
end HautevilleHouse
