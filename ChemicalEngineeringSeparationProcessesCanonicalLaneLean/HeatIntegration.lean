import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringSeparationProcessesCanonicalLaneLean

structure HeatIntegrationPackage (A : AdmissibleClass) where
  pinchAnalysis : Prop
  heatExchangerNetwork : Prop
  minimumUtilityTarget : Prop
  areaTarget : Prop
  compositeCurve : Prop

structure HeatIntegrationEvidence (A : AdmissibleClass) (P : HeatIntegrationPackage A) where
  pinchAnalysisClosed : P.pinchAnalysis
  heatExchangerNetworkClosed : P.heatExchangerNetwork
  minimumUtilityTargetClosed : P.minimumUtilityTarget
  areaTargetClosed : P.areaTarget
  compositeCurveClosed : P.compositeCurve

def HeatIntegrationClosed (A : AdmissibleClass) (P : HeatIntegrationPackage A) : Prop :=
  P.pinchAnalysis ∧ P.heatExchangerNetwork ∧ P.minimumUtilityTarget ∧ P.areaTarget ∧ P.compositeCurve

theorem heat_integration_closed_from_evidence (A : AdmissibleClass) (P : HeatIntegrationPackage A)
    (E : HeatIntegrationEvidence A P) : HeatIntegrationClosed A P := by
  exact And.intro E.pinchAnalysisClosed (And.intro E.heatExchangerNetworkClosed (And.intro E.minimumUtilityTargetClosed (And.intro E.areaTargetClosed E.compositeCurveClosed)))

end ChemicalEngineeringSeparationProcessesCanonicalLaneLean
end HautevilleHouse