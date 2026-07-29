import canonicalLaneMathlib.AdmissibleClass

/-!
# Noncollapsing Package for Chemical Engineering Separation Processes
This package captures the requirement that the separation process does not collapse into trivial solutions.
-/

namespace HautevilleHouse
namespace ChemicalEngineeringSeparationProcessesCanonicalLaneLean

structure NoncollapsingPackage (G : TransferModelPackage) where
  massTransferCoefficientStable : Prop
  interfaceEquilibriumMaintained : Prop
  noncollapsingIntegralBound : Prop

structure NoncollapsingEvidence (N : NoncollapsingPackage G) where
  massTransferCoefficientStableClosed : N.massTransferCoefficientStable
  interfaceEquilibriumMaintainedClosed : N.interfaceEquilibriumMaintained
  noncollapsingIntegralBoundClosed : N.noncollapsingIntegralBound

def NoncollapsingClosed (N : NoncollapsingPackage G) : Prop :=
  N.massTransferCoefficientStable ∧ N.interfaceEquilibriumMaintained ∧ N.noncollapsingIntegralBound

theorem noncollapsing_closed_from_evidence (N : NoncollapsingPackage G)
    (E : NoncollapsingEvidence N) : NoncollapsingClosed N := by
  exact And.intro E.massTransferCoefficientStableClosed
    (And.intro E.interfaceEquilibriumMaintainedClosed E.noncollapsingIntegralBoundClosed)

end ChemicalEngineeringSeparationProcessesCanonicalLaneLean
end HautevilleHouse
