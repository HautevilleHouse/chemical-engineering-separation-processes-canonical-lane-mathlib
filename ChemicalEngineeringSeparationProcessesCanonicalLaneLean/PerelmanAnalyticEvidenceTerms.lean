import canonicalLaneMathlib.AdmissibleClass

/-!
# Perelman Analytic Evidence Terms for Chemical Engineering Separation Processes
This module exposes the proof terms for each analytic certificate in the separation process route.
-/

namespace HautevilleHouse
namespace ChemicalEngineeringSeparationProcessesCanonicalLaneLean

structure MassTransferEvidenceTerms (C : MassTransferCertificate) where
  filmDiffusionEquation : C.filmDiffusionEquation
  effectiveDiffusivityModel : C.effectiveDiffusivityModel
  massTransferCoefficientCorrelation : C.massTransferCoefficientCorrelation
  massTransferClosed : MassTransferClosed C

def MassTransferCertificate.evidenceTerms (C : MassTransferCertificate) : MassTransferEvidenceTerms C :=
  {
    filmDiffusionEquation := C.filmDiffusionEquationClosed
    effectiveDiffusivityModel := C.effectiveDiffusivityModelClosed
    massTransferCoefficientCorrelation := C.massTransferCoefficientCorrelationClosed
    massTransferClosed := mass_transfer_closed_from_evidence C.massTransferEvidence
  }

structure EquilibriumStageEvidenceTerms (C : EquilibriumStageCertificate) where
  equilibriumRelation : C.equilibriumRelation
  operatingLineDerivation : C.operatingLineDerivation
  stageEfficiencyModel : C.stageEfficiencyModel
  equilibriumStageClosed : EquilibriumStageClosed C

def EquilibriumStageCertificate.evidenceTerms (C : EquilibriumStageCertificate) : EquilibriumStageEvidenceTerms C :=
  {
    equilibriumRelation := C.equilibriumRelationClosed
    operatingLineDerivation := C.operatingLineDerivationClosed
    stageEfficiencyModel := C.stageEfficiencyModelClosed
    equilibriumStageClosed := equilibrium_stage_closed_from_evidence C.equilibriumStageEvidence
  }

structure RateBasedEvidenceTerms (C : RateBasedCertificate) where
  materialBalances : C.materialBalances
  energyBalances : C.energyBalances
  transferRateEquations : C.transferRateEquations
  rateBasedClosed : RateBasedClosed C

def RateBasedCertificate.evidenceTerms (C : RateBasedCertificate) : RateBasedEvidenceTerms C :=
  {
    materialBalances := C.materialBalancesClosed
    energyBalances := C.energyBalancesClosed
    transferRateEquations := C.transferRateEquationsClosed
    rateBasedClosed := rate_based_closed_from_evidence C.rateBasedEvidence
  }

end ChemicalEngineeringSeparationProcessesCanonicalLaneLean
end HautevilleHouse
