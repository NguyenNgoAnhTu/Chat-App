package com.example.Chat_app.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.*;

@AllArgsConstructor
@Data
@NoArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)

public class ChatMessage {
    private String sender;
    private String content;
    private String timestamp;



}
