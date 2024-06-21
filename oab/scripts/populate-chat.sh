#!/bin/bash
dbPrompt=$(cat .dbPrompt.txt)
dbName=$(cat .dbName.txt)

cd ../routes

# Register the characters
./lawyer-register-akina.sh
./lawyer-register-youko.sh
./lawyer-register-tsubasa.sh

# Log them in
./lawyer-login-akina.sh
./lawyer-login-youko.sh
./lawyer-login-tsubasa.sh

# Create a settlement with them in
./settlement-create.sh

# Make them chat a bit
./chat-send-message-youko.sh   "Hey guys, I know it's kinda silly, but have you ever thought about the type of guy you'd like to date? 😳"
sleep 2s
./chat-send-message-akina.sh   "Oh wow, Youko, that's a bold question! 😅 But, yeah, I've thought about it a bit. How about you, Tsubasa?"
sleep 2s
./chat-send-message-tsubasa.sh "Um, yeah, a little. It's embarrassing to talk about, but I guess we are close enough. 😳"
sleep 2s
./chat-send-message-youko.sh   "Hehe, yeah, it's just us! So, Akina, you go first! What kind of guy do you like?"
sleep 2s
./chat-send-message-akina.sh   "Oh gosh, okay... um, I think I like someone who's kind and thoughtful. Someone who can make me laugh but also respects my space. How about you, Youko?"
sleep 2s
./chat-send-message-tsubasa.sh "That sounds nice, Akina! I think I like someone who's a bit more reserved, but really genuine and caring. Someone who appreciates the small things, like a quiet walk or a simple conversation. 😌"
sleep 2s
./chat-send-message-youko.sh   "Aww, that's sweet, Youko! For me, I think I'd like someone who's passionate about something, you know? Like, it doesn't matter what it is, but seeing them really dedicated to something is attractive to me. And they should be gentle and patient too. 😶"
sleep 2s
./chat-send-message-akina.sh   "Oh, I totally get that, Tsubasa! Passion can be really attractive. I think someone who loves what they do is very inspiring. 😊"
sleep 2s
./chat-send-message-tsubasa.sh "Yes, and patience is so important! I think we all want someone who understands us and is willing to take things slow. 😌"
sleep 2s
./chat-send-message-youko.sh   "Absolutely. It's so nice to share this with you guys. I feel like I know you both even better now. 💕"
sleep 2s
./chat-send-message-akina.sh   "Same here, Tsubasa! It's nice to talk about these things with you both. I feel less shy about it now. 😊"
sleep 2s
./chat-send-message-tsubasa.sh "Me too! I'm so glad we had this conversation. Let's keep supporting each other and maybe one day, we'll find those amazing guys we talked about. 💖"
sleep 2s
./chat-send-message-youko.sh   "Definitely! And until then, we've got each other. 💞"
sleep 2s
./chat-send-message-akina.sh   "Exactly! Love you both! 💕"
sleep 2s
./chat-send-message-tsubasa.sh "Love you too! 💗"
sleep 2s
./chat-send-message-youko.sh   "Love you! 💓"
