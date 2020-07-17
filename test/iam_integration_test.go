package test

import (
	"testing"

	"github.com/stretchr/testify/assert"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestIntegrationIam(t *testing.T) {
	terraformOptions := &terraform.Options{
		TerraformDir: "../example",
	}

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	arn := terraform.Output(t, terraformOptions, "arn")
	id := terraform.Output(t, terraformOptions, "id")
	assert.Contains(t, arn, "arn:aws:iam")
	assert.Equal(t, id, "role-test")

}
