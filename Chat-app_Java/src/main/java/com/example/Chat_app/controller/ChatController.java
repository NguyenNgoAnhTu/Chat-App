package com.example.Chat_app.controller;

import com.example.Chat_app.model.ChatMessage;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Controller
public class ChatController {

    @MessageMapping("/chat") // client gửi tin nhắn đến "/app/chat"
    @SendTo("/topic/messages") // broadcast ra "/topic/messages"
    public ChatMessage send(ChatMessage message) {
        message.setTimestamp(LocalDateTime.now().format(DateTimeFormatter.ofPattern("HH:mm:ss")).toString());
        System.out.println(">> message = " + message);

        return message;
    }
}
