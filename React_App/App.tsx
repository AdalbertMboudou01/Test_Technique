/**
 * Enhanced Bottom Tab App
 */

import React from "react";
import { NavigationContainer } from "@react-navigation/native";
import { createBottomTabNavigator } from "@react-navigation/bottom-tabs";
import Icon from "react-native-vector-icons/Feather";

import UserIdScreen from "./src/UserIdScreen";
import ProfileScreen from "./src/ProfileScreen";

const Tab = createBottomTabNavigator();

export default function App() {
  return (
    <NavigationContainer>
      <Tab.Navigator
        screenOptions={({ route }) => ({
          headerShown: false,

          // ICONS
          tabBarIcon: ({ focused, size, color }) => {
            let iconName;

            if (route.name === "User") iconName = "user";
            else if (route.name === "Profile") iconName = "user-check";

            return (
              <Icon
                name={iconName}
                size={focused ? 26 : 22}
                color={color}
              />
            );
          },

          // COULEURS
          tabBarActiveTintColor: "#007bff",
          tabBarInactiveTintColor: "#999",

          // STYLE DE LA BARRE
          tabBarStyle: {
            height: 60,
            paddingBottom: 8,
            paddingTop: 6,
            backgroundColor: "#fff",
            borderTopWidth: 0,
            elevation: 10,
          },

          // STYLE DU TEXTE
          tabBarLabelStyle: {
            fontSize: 12,
            fontWeight: "600",
          },
        })}
      >
        <Tab.Screen name="User" component={UserIdScreen} />
        <Tab.Screen name="Profile" component={ProfileScreen} />
      </Tab.Navigator>
    </NavigationContainer>
  );
}
