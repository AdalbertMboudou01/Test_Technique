import React, { useEffect, useState } from "react";
import { View, Text, Button, NativeModules } from "react-native";
import AsyncStorage from "@react-native-async-storage/async-storage";

const { FlutterAzeoo } = NativeModules;

export default function ProfileScreen() {
  const [userId, setUserId] = useState(null);

  useEffect(() => {
    AsyncStorage.getItem("userId").then(v => setUserId(v));
  }, []);

  if (!userId) {
    return (
      <View style={{
        flex: 1,
        justifyContent: "center",
        alignItems: "center",
        padding: 20,
      }}>
        <Text>No userId found. Go to tab 1 to save one.</Text>
      </View>
    );
  }

  return (
    <View style={{
      flex: 1,
      justifyContent: "center",
      alignItems: "center",
      padding: 20,
    }}>
      <Text style={{ marginBottom: 20, fontSize: 18 }}>
        User ID: {userId}
      </Text>

      <Button
        title="Open Flutter Profile"
        onPress={() => FlutterAzeoo.openProfile(userId)}
      />
    </View>
  );
}
