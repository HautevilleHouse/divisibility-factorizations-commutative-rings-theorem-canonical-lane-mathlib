import canonicalLaneMathlib.IrreducibleFactorizations
import Mathlib.Algebra.UniqueFactorizationDomain

namespace HautevilleHouse
namespace DivisibilityFactorizationsCommutativeRingsTheoremCanonicalLaneLean

structure UniqueFactorizationContext (ctx : IrreducibleFactorizationContext) where
  uniqueness : ∀ (x : ctx.ring), x ≠ 0 → Nonunit x →
    ∀ (L1 L2 : List (ctx.ring)), (∀ a ∈ L1, Irreducible a) → (∀ a ∈ L2, Irreducible a) →
    (L1.prod : ctx.ring) = x → (L2.prod : ctx.ring) = x →
    Multiset.ofList L1 = Multiset.ofList L2

theorem ufd_iff_unique_factorization (ctx : IrreducibleFactorizationContext) :
    UniqueFactorizationContext ctx ↔ IsUniqueFactorizationDomain ctx.ring ctx.ringStr :=
  by
    constructor
    · intro h; exact ⟨h.uniqueness⟩
    · intro h; exact ⟨h.uniqueness⟩

structure UniqueFactorizationEvidence (ctx : IrreducibleFactorizationContext)
    (U : UniqueFactorizationContext ctx) where
  baseEvidence : AtomicDomainEvidence ctx
  uniquenessTerm : U.uniqueness

theorem unique_factorization_closed (ctx : IrreducibleFactorizationContext)
    (U : UniqueFactorizationContext ctx) (E : UniqueFactorizationEvidence ctx U) :
    UniqueFactorizationContext ctx := U

end DivisibilityFactorizationsCommutativeRingsTheoremCanonicalLaneLean
end HautevilleHouse
