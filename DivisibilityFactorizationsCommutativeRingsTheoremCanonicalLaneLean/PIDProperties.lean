import DivisibilityFactorizationsCommutativeRingsTheoremCanonicalLaneLean.UFDStructure

namespace HautevilleHouse
namespace DivisibilityFactorizationsCommutativeRingsTheoremCanonicalLaneLean

structure PIDStructure where
  domain : DivisibilitySpace
  everyIdealPrincipal : Prop
  noetherian : Prop
  everyPrimeMaximal : Prop

structure PIDClosure (P : PIDStructure) : Prop where
  everyIdealPrincipalClosed : P.everyIdealPrincipal
  noetherianClosed : P.noetherian
  everyPrimeMaximalClosed : P.everyPrimeMaximal

theorem pid_inherits_ufd (P : PIDStructure) : UFDClosure ({
    domain := P.domain,
    irreducibleFactorization := P.everyIdealPrincipal,
    uniquenessUpToOrder := P.everyIdealPrincipal,
    factorChainTerminates := P.noetherian
  } : UFDStructure) := by
  refine {
    irreducibleFactorizationClosed := P.everyIdealPrincipal,
    uniquenessUpToOrderClosed := P.everyIdealPrincipal,
    factorChainTerminatesClosed := P.noetherian
  }

end DivisibilityFactorizationsCommutativeRingsTheoremCanonicalLaneLean
end HautevilleHouse
