package terratest

import (
  "testing"

  "github.com/gruntwork-io/terratest/modules/terraform"
  "github.com/stretchr/testify/require"
)

func TestLab10(t *testing.T) {
  t.Parallel()

  tfOptions := &terraform.Options{
    TerraformDir: "..",
    NoColor:      true,
  }

  defer terraform.Destroy(t, tfOptions)
  terraform.InitAndApply(t, tfOptions)

  pet := terraform.Output(t, tfOptions, "pet_name")
  require.NotEmpty(t, pet)
}
