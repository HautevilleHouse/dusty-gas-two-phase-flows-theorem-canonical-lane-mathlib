import DustyGasTwoPhaseFlowsCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace DustyGasTwoPhaseFlowsCanonicalLaneLean

structure AdmissibleClass where
  object : AdmittedTheoremObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  NativeBridgeClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end DustyGasTwoPhaseFlowsCanonicalLaneLean
end HautevilleHouse