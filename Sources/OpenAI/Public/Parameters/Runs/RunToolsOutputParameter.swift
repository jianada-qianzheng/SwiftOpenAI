//
//  RunToolsOutputParameter.swift
//
//
//  Created by James Rochabrun on 11/16/23.
//

import Foundation

/// When a run has the status: "requires_action" and required_action.type is submit_tool_outputs, this endpoint can be used to submit the [outputs](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) from the tool calls once they're all completed. All outputs must be submitted in a single request.
public struct RunToolsOutputParameter: Encodable {
   
   /// A list of tools for which the outputs are being submitted.
   public let toolOutputs: [ToolOutput]
   
   public struct ToolOutput: Encodable {
      
      /// The ID of the tool call in the `required_action` object within the run object the output is being submitted for.
      public let toolCallId: String?
      /// The output of the tool call to be submitted to continue the run.
      public let output: String?
      
      enum CodingKeys: String, CodingKey {
         case toolCallId = "tool_call_id"
         case output
      }
      
      public init(
         toolCallId: String?,
         output: String?)
      {
         self.toolCallId = toolCallId
         self.output = output
      }
   }
   
   enum CodingKeys: String, CodingKey {
      case toolOutputs = "tool_outputs"
   }
   
   public init(
      toolOutputs: [ToolOutput])
   {
      self.toolOutputs = toolOutputs
   }
}

