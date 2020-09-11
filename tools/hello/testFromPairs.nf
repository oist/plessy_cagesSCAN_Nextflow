#!/usr/bin/env nextflow

nextflow.enable.dsl=2

channel
  .fromFilePairs("${params.glob}*{1,2}*")
  .map { row -> [ row[0], row[1][0], row[1][1] ] }
  .set { ch_input }

workflow {
  ch_input.view()
}