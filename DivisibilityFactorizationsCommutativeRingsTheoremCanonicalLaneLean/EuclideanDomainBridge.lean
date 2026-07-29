import DivisibilityFactorizationsCommutativeRingsTheoremCanonicalLaneLean.PIDProperties

namespace HautevilleHouse
namespace DivisibilityFactorizationsCommutativeRingsTheoremCanonicalLaneLean

structure EuclideanDomainStructure where
  domain : DivisibilitySpace
  euclideanFunction : domain.carrier → ℕ
  divisionWithRemainder : ∀ a b, b ≠ domain.zero → ∃ q r, a = domain.multiplication q b + r ∧ (r = domain.zero ∨ euclideanFunction r < euclideanFunction b)
  euclideanAxioms : domain.ringAxioms

structure EuclideanDomainClosure (E : EuclideanDomainStructure) : Prop where
  divisionWithRemainderClosed : ∀ a b, b ≠ E.domain.zero → ∃ q r, a = E.domain.multiplication q b + r ∧ (r = E.domain.zero ∨ E.euclideanFunction r < E.euclideanFunction b)
  pidInherited : PIDClosure ({
    domain := E.domain,
    everyIdealPrincipal := by
      intro I
      sorry,
    noetherian := by
      admit,
    everyPrimeMaximal := by
      admit
  } : PIDStructure)

theorem euclidean_domain_bridge (E : EuclideanDomainStructure) : EuclideanDomainClosure E := by
  refine {
    divisionWithRemainderClosed := E.divisionWithRemainder,
    pidInherited := {
      everyIdealPrincipalClosed := by
        intro I
        -- typical proof using Euclidean algorithm
        sorry,
      noetherianClosed := by
        sorry,
      everyPrimeMaximalClosed := by
        sorry
    }
  }

end DivisibilityFactorizationsCommutativeRingsTheoremCanonicalLaneLean
end HautevilleHouse
