/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 */
import React from "react";
import { NavigationContainer } from "@react-navigation/native";
import { createBottomTabNavigator } from "@react-navigation/bottom-tabs";

import UserIdScreen from "./src/UserIdScreen";
import ProfileScreen from "./src/ProfileScreen";

const Tab = createBottomTabNavigator();

export default function App() {
  return (
    <NavigationContainer>
      <Tab.Navigator>
        <Tab.Screen name="User" component={UserIdScreen} />
        <Tab.Screen name="Profile" component={ProfileScreen} />
      </Tab.Navigator>
    </NavigationContainer>
  );
}
