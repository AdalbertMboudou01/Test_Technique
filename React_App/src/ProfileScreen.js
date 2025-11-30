import React, { useState } from "react";
import { View, Text, Button } from "react-native";
import AsyncStorage from "@react-native-async-storage/async-storage";
import { useFocusEffect } from "@react-navigation/native";
import { NativeModules } from "react-native";

// 👇 IMPORTANT : ton module natif s'appelle FlutterAzeoo
const { FlutterAzeoo } = NativeModules;

export default function ProfileScreen() {
  const [userId, setUserId] = useState(null);

  // 🔥 Recharge l'userId dès que l'onglet Profile devient actif
  useFocusEffect(
    React.useCallback(() => {
      const loadUserId = async () => {
        const value = await AsyncStorage.getItem("userId");
        setUserId(value);
      };
      loadUserId();
    }, [])
  );

  const openFlutterProfile = () => {
    if (!userId) return;

    // 👇 Appel CORRECT au module natif Flutter
    FlutterAzeoo.openProfile(userId);
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
      <Text style={{ fontSize: 20, marginBottom: 20 }}>
        User ID: {userId ?? "No ID"}
      </Text>

      <Button title="OPEN FLUTTER PROFILE" onPress={openFlutterProfile} />
    </View>
  );
}
