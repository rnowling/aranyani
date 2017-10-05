#!/usr/bin/env bats

load model_setup_helper

@test "Run likelihood_ratio_test with no arguments" {
    run ${BATS_TEST_DIRNAME}/../bin/likelihood_ratio_test
    [ "$status" -eq 2 ]
}

@test "Run likelihood_ratio_test with --help option" {
    run ${BATS_TEST_DIRNAME}/../bin/likelihood_ratio_test --help
    [ "$status" -eq 0 ]
}

@test "Calculate likelihood_ratio_test (categories)" {
    run ${BATS_TEST_DIRNAME}/../bin/likelihood_ratio_test \
	    --workdir ${WORKDIR_PATH} \
        --model-type lr

    [ "$status" -eq 0 ]
    [ -e "${WORKDIR_PATH}/statistics/snp_likelihood_ratio_tests.txt" ]
}

@test "Calculate likelihood_ratio_test (counts, lr)" {
    run ${BATS_TEST_DIRNAME}/../bin/likelihood_ratio_test \
	    --workdir ${COUNTS_WORKDIR_PATH} \
        --model-type lr

    [ "$status" -eq 0 ]
    [ -e "${COUNTS_WORKDIR_PATH}/statistics/snp_likelihood_ratio_tests.txt" ]
}

@test "Calculate likelihood_ratio_test (counts, prob-solver)" {
    run ${BATS_TEST_DIRNAME}/../bin/likelihood_ratio_test \
	    --workdir ${COUNTS_WORKDIR_PATH} \
        --model-type prob-solver

    [ "$status" -eq 0 ]
    [ -e "${COUNTS_WORKDIR_PATH}/statistics/snp_likelihood_ratio_tests.txt" ]
}