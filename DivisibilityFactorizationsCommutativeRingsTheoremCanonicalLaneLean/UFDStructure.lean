import DivisibilityFactorizationsCommutativeRingsTheoremCanonicalLaneLean.DomainObjects

namespace HautevilleHouse
namespace DivisibilityFactorizationsCommutativeRingsTheoremCanonicalLaneLean

structure UFDStructure where
  domain : DivisibilitySpace
  irreducibleFactorization : Prop
  uniquenessUpToOrder : Prop
  factorChainTerminates : Prop
  factorizationExistence : irreducibleFactorization → factorChainTerminates
  factorizationUniqueness : irreducibleFactorization → uniquenessUpToOrder

structure UFDClosure (U : UFDStructure) : Prop where
  irreducibleFactorizationClosed : U.irreducibleFactorization
  uniquenessUpToOrderClosed : U.uniquenessUpToOrder
  factorChainTerminatesClosed : U.factorChainTerminates

theorem ufd_closure_from_structure (U : UFDStructure) (h : U.irreducibleFactorization) (h' : U.uniquenessUpToOrder) (h'' : U.factorChainTerminates) : UFDClosure U := by
  exact { irreducibleFactorizationClosed := h, uniquenessUpToOrderClosed := h', factorChainTerminatesClosed := h'' }

end DivisibilityFactorizationsCommutativeRingsTheoremCanonicalLaneLean
end HautevilleHouse
