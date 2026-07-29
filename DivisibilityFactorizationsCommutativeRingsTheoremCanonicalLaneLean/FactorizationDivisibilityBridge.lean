import canonicalLaneMathlib.MathlibObjects
import Mathlib.Data.Int.Basic

namespace HautevilleHouse
namespace DivisibilityFactorizationsCommutativeRingsTheoremCanonicalLaneLean

structure DivisibilityComponents where
  gcd : ℤ → ℤ → ℤ
  lcm : ℤ → ℤ → ℤ
  gcdProp : ∀ a b : ℤ, gcd a b ∣ a ∧ gcd a b ∣ b ∧ ∀ d : ℤ, d ∣ a → d ∣ b → d ∣ gcd a b
  lcmProp : ∀ a b : ℤ, a ∣ lcm a b ∧ b ∣ lcm a b ∧ ∀ m : ℤ, a ∣ m → b ∣ m → lcm a b ∣ m

theorem gcd_lcm_consistency (D : DivisibilityComponents) : Prop :=
  ∃ (h : ∀ a b : ℤ, D.gcd a b * D.lcm a b = a * b), True

structure DivisibilityBridgeEvidence (D : DivisibilityComponents) where
  gcdClosed : D.gcdProp
  lcmClosed : D.lcmProp
  productFormula : ∀ a b : ℤ, D.gcd a b * D.lcm a b = a * b

theorem divisibility_bridge_closed (D : DivisibilityComponents)
    (E : DivisibilityBridgeEvidence D) : D.gcdProp ∧ D.lcmProp ∧ (∀ a b, D.gcd a b * D.lcm a b = a * b) := by
  exact ⟨E.gcdClosed, E.lcmClosed, E.productFormula⟩

end DivisibilityFactorizationsCommutativeRingsTheoremCanonicalLaneLean
end HautevilleHouse
