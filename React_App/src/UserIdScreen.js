import React, { useState, useEffect } from "react";
import { View, TextInput, Button, Text, Alert } from "react-native";
import AsyncStorage from "@react-native-async-storage/async-storage";

export default function UserIdScreen() {
  const [userId, setUserId] = useState("");

  useEffect(() => {
    AsyncStorage.getItem("userId").then((v) => v && setUserId(v));
  }, []);

  const save = async () => {
    // 🔥 Autoriser uniquement 1 ou 3
    if (userId !== "1" && userId !== "3") {
      Alert.alert(
        "Erreur",
        "Seuls les userId 1 et 3 sont acceptés.\nVeuillez réessayer."
      );
      return;
    }

    await AsyncStorage.setItem("userId", userId);
    Alert.alert("Saved!");

    // ❌ Pas de navigation automatique
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
        onChangeText={(text) => {
          // 🔥 Empêche la saisie de lettres et caractères non numériques
          const cleaned = text.replace(/[^0-9]/g, "");
          setUserId(cleaned);
        }}
        keyboardType="numeric"
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
