import canonicalLaneMathlib.AdmissibleClass
import DivisibilityFactorizationsCommutativeRingsTheoremCanonicalLaneLean.UniqueFactorizationStructure

namespace HautevilleHouse
namespace DivisibilityFactorizationsCommutativeRingsTheoremCanonicalLaneLean

structure IrreducibleFactorData (R : Type u) [CommRing R] (U : UniqueFactorizationDomain R G) where
  factorizationMap : R → Multiset (R × ℕ)
  factorMultiplicity : R → R → ℕ
  multiplicityWellDefined : ∀ a b : R, a ≠ 0 → b ≠ 0 → factorMultiplicity a b = (factorizationMap a).count (b, 1) + (factorizationMap a).count (b, 0)

structure IrreducibleFactorPackage {R : Type u} [CommRing R] {G : GCDDomain R} {U : UniqueFactorizationDomain R G} (I : IrreducibleFactorData R U) where
  factorizationExists : Prop
  multiplicityAdditive : Prop
  multiplicityMultiplicative : Prop
  gcdViaMinMultiplicity : Prop

structure IrreducibleFactorEvidence {R : Type u} [CommRing R] {G : GCDDomain R} {U : UniqueFactorizationDomain R G} {I : IrreducibleFactorData R U} (Pkg : IrreducibleFactorPackage I) where
  factorizationExistsClosed : Pkg.factorizationExists
  multiplicityAdditiveClosed : Pkg.multiplicityAdditive
  multiplicityMultiplicativeClosed : Pkg.multiplicityMultiplicative
  gcdViaMinMultiplicityClosed : Pkg.gcdViaMinMultiplicity

def IrreducibleFactorClosed {R : Type u} [CommRing R] {G : GCDDomain R} {U : UniqueFactorizationDomain R G} {I : IrreducibleFactorData R U} (Pkg : IrreducibleFactorPackage I) : Prop :=
  Pkg.factorizationExists ∧ Pkg.multiplicityAdditive ∧ Pkg.multiplicityMultiplicative ∧ Pkg.gcdViaMinMultiplicity

theorem irreducible_factor_closed_from_evidence {R : Type u} [CommRing R] {G : GCDDomain R} {U : UniqueFactorizationDomain R G} {I : IrreducibleFactorData R U} (Pkg : IrreducibleFactorPackage I) (E : IrreducibleFactorEvidence Pkg) : IrreducibleFactorClosed Pkg := by
  exact And.intro E.factorizationExistsClosed (And.intro E.multiplicityAdditiveClosed (And.intro E.multiplicityMultiplicativeClosed E.gcdViaMinMultiplicityClosed))

end DivisibilityFactorizationsCommutativeRingsTheoremCanonicalLaneLean
end HautevilleHouse
