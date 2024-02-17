class GenerationConfig {
  // Controls the randomness of the output.
  final double tempature;

  // Optional. The maximum number of tokens to consider when sampling
  final int? topK;

  // Optional. The maximum cumulative probability of tokens to consider when sampling.
  final double? topP;

  // The maximum number of tokens to include in a candidate.
  // If unset, this will default to output_token_limit specified in the model's specification.
  final int maxOutputTokens;

  // The set of character sequences (up to 5) that will stop output generation.
  // If specified, the API will stop at the first appearance of a stop sequence.
  // The stop sequence will not be included as part of the response.
  final List<String> stopSequences;

  // Number of generated responses to return.
  final int candidateCount;

  GenerationConfig({
    required this.tempature,
    required this.maxOutputTokens,
    required this.stopSequences,
    required this.candidateCount,
    this.topK,
    this.topP,
  });
}
