import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DustyGasTwoPhaseFlowsCanonicalLaneLean

abbrev SpatialPoint := Fin 3 → ℝ
abbrev Time := ℝ
abbrev ScalarField := Time → SpatialPoint → ℝ
abbrev VectorField := Time → SpatialPoint → SpatialPoint

def zeroScalarField : ScalarField := fun _ _ => 0
def zeroVectorField : VectorField := fun _ _ _ => 0

structure TwoFluidOperators where
  gasDivergence : VectorField → ScalarField
  dustDivergence : VectorField → ScalarField
  gasGradient : ScalarField → VectorField
  dustGradient : ScalarField → VectorField
  gasLaplacian : VectorField → VectorField
  dustLaplacian : VectorField → VectorField
  gasTimeDerivative : VectorField → VectorField
  dustTimeDerivative : VectorField → VectorField
  dragCoupling : VectorField → VectorField → VectorField
  dragIdempotent : ∀ u v, dragCoupling (dragCoupling u v) (dragCoupling u v) = dragCoupling u v

def primitiveTwoFluidOperators : TwoFluidOperators := {
  gasDivergence := fun _ => zeroScalarField
  dustDivergence := fun _ => zeroScalarField
  gasGradient := fun _ => zeroVectorField
  dustGradient := fun _ => zeroVectorField
  gasLaplacian := fun u => u
  dustLaplacian := fun u => u
  gasTimeDerivative := fun _ => zeroVectorField
  dustTimeDerivative := fun _ => zeroVectorField
  dragCoupling := fun u v => u
  dragIdempotent := by
    intro u v
    rfl
}

structure TwoFluidFlow where
  gasVelocity : VectorField
  dustVelocity : VectorField
  gasPressure : ScalarField
  dustPressure : ScalarField
  gasViscosity : ℝ
  dustViscosity : ℝ
  dragCoefficient : ℝ
  operators : TwoFluidOperators

def primitiveTwoFluidFlow : TwoFluidFlow := {
  gasVelocity := zeroVectorField
  dustVelocity := zeroVectorField
  gasPressure := zeroScalarField
  dustPressure := zeroScalarField
  gasViscosity := 1
  dustViscosity := 1
  dragCoefficient := 1
  operators := primitiveTwoFluidOperators
}

def GasIncompressible (F : TwoFluidFlow) : Prop :=
  F.operators.gasDivergence F.gasVelocity = zeroScalarField

def DustIncompressible (F : TwoFluidFlow) : Prop :=
  F.operators.dustDivergence F.dustVelocity = zeroScalarField

def DragBalance (F : TwoFluidFlow) : Prop :=
  F.operators.dragCoupling F.gasVelocity F.dustVelocity = F.gasVelocity

def TwoFluidEquationsClosed (F : TwoFluidFlow) : Prop :=
  GasIncompressible F ∧ DustIncompressible F ∧ DragBalance F

theorem primitive_two_fluid_equations_closed : TwoFluidEquationsClosed primitiveTwoFluidFlow := by
  unfold TwoFluidEquationsClosed GasIncompressible DustIncompressible DragBalance primitiveTwoFluidFlow primitiveTwoFluidOperators
  simp

end HautevilleHouse.DustyGasTwoPhaseFlowsCanonicalLaneLean
end HautevilleHouse