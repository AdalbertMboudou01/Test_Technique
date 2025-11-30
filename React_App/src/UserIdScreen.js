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
    <View style={{ padding: 20 }}>
      <Text>Enter User ID (1 or 3):</Text>

      <TextInput
        value={userId}
        onChangeText={setUserId}
        style={{
          borderWidth: 1, padding: 10, marginVertical: 10
        }}
      />

      <Button title="Save User ID" onPress={save} />
    </View>
  );
}
