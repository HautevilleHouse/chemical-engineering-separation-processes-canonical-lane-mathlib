import ChemicalEngineeringSeparationProcessesCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace ChemicalEngineeringSeparationProcessesCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure SeparationProcessSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure SeparationProcessAdmittedObject where
  space : SeparationProcessSpace
  continuousPhaseEquilibrium : Prop
  thermodynamicConsistency : Prop
  separationModel : Type
  modelTopology : TopologicalSpace separationModel
  processFeasible : Prop
  conclusion : processFeasible

structure SeparationEndgameState where
  object : SeparationProcessAdmittedObject

def SeparationWitnessClosed (O : SeparationProcessAdmittedObject) : Prop :=
  O.processFeasible

end ChemicalEngineeringSeparationProcessesCanonicalLaneLean
end HautevilleHouse