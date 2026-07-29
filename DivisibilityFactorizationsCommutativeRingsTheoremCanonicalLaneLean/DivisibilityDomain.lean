import canonicalLaneMathlib.AdmissibleClass

/-!
# Divisibility Domain Package
-/

namespace HautevilleHouse
namespace DivisibilityFactorizationsCommutativeRingsTheoremCanonicalLaneLean

structure DivisibilityDomain where
  carrier : Type u
  addition : carrier -> carrier -> carrier
  multiplication : carrier -> carrier -> carrier
  zero : carrier
  one : carrier
  addAssoc : ∀ a b c : carrier, addition (addition a b) c = addition a (addition b c)
  addComm : ∀ a b : carrier, addition a b = addition b a
  addZero : ∀ a : carrier, addition a zero = a
  zeroAdd : ∀ a : carrier, addition zero a = a
  addInv : ∀ a : carrier, ∃ b : carrier, addition a b = zero
  mulAssoc : ∀ a b c : carrier, multiplication (multiplication a b) c = multiplication a (multiplication b c)
  mulOne : ∀ a : carrier, multiplication a one = a
  oneMul : ∀ a : carrier, multiplication one a = a
  mulComm : ∀ a b : carrier, multiplication a b = multiplication b a
  leftDistrib : ∀ a b c : carrier, multiplication a (addition b c) = addition (multiplication a b) (multiplication a c)
  rightDistrib : ∀ a b c : carrier, multiplication (addition a b) c = addition (multiplication a c) (multiplication b c)
  zeroNotOne : zero ≠ one
  noZeroDivisors : ∀ a b : carrier, multiplication a b = zero → a = zero ∨ b = zero

structure DivisibilityDomainEvidence (R : DivisibilityDomain) where
  addAssocClosed : R.addAssoc
  addCommClosed : R.addComm
  addZeroClosed : R.addZero
  zeroAddClosed : R.zeroAdd
  addInvClosed : R.addInv
  mulAssocClosed : R.mulAssoc
  mulOneClosed : R.mulOne
  oneMulClosed : R.oneMul
  mulCommClosed : R.mulComm
  leftDistribClosed : R.leftDistrib
  rightDistribClosed : R.rightDistrib
  zeroNotOneClosed : R.zeroNotOne
  noZeroDivisorsClosed : R.noZeroDivisors

def DivisibilityDomainClosed (R : DivisibilityDomain) : Prop :=
  R.addAssoc ∧ R.addComm ∧ R.addZero ∧ R.zeroAdd ∧ R.addInv ∧
  R.mulAssoc ∧ R.mulOne ∧ R.oneMul ∧ R.mulComm ∧
  R.leftDistrib ∧ R.rightDistrib ∧ R.zeroNotOne ∧ R.noZeroDivisors

theorem divisibility_domain_closed_from_evidence (R : DivisibilityDomain) (E : DivisibilityDomainEvidence R) :
    DivisibilityDomainClosed R := by
  exact And.intro E.addAssocClosed
    (And.intro E.addCommClosed
      (And.intro E.addZeroClosed
        (And.intro E.zeroAddClosed
          (And.intro E.addInvClosed
            (And.intro E.mulAssocClosed
              (And.intro E.mulOneClosed
                (And.intro E.oneMulClosed
                  (And.intro E.mulCommClosed
                    (And.intro E.leftDistribClosed
                      (And.intro E.rightDistribClosed
                        (And.intro E.zeroNotOneClosed E.noZeroDivisorsClosed)))))))))))

end DivisibilityFactorizationsCommutativeRingsTheoremCanonicalLaneLean
end HautevilleHouse