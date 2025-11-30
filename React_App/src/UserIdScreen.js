import React, { useState, useEffect } from "react";
import { View, TextInput, Button, Text } from "react-native";
import AsyncStorage from "@react-native-async-storage/async-storage";

export default function UserIdScreen() {
  const [userId, setUserId] = useState("");

  useEffect(() => {
    AsyncStorage.getItem("userId").then(v => v && setUserId(v));
  }, []);

  const save = async () => {
    await AsyncStorage.setItem("userId", userId);
    alert("Saved!");
  };

  return (
    <View
      style={{
        flex: 1,
        justifyContent: "center",
        alignItems: "center",
        padding: 20,
      }}
    >
      <Text style={{ fontSize: 18, marginBottom: 15 }}>
        Enter User ID (1 or 3):
      </Text>

      <TextInput
        value={userId}
        onChangeText={setUserId}
        style={{
          width: "80%",
          borderWidth: 1,
          borderRadius: 8,
          padding: 10,
          marginBottom: 20,
        }}
        placeholder="Enter a user ID"
      />

      <Button title="Save User ID" onPress={save} />
    </View>
  );
}
