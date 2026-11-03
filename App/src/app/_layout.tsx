import React, { useState, useEffect } from 'react';
import { DarkTheme, DefaultTheme, ThemeProvider } from 'expo-router';
import * as SplashScreen from 'expo-splash-screen';
import { Stack } from 'expo-router';

SplashScreen.preventAutoHideAsync();

export default function Layout() {
  const [isDarkMode, setIsDarkMode] = useState(true); // Alterado para true para combinar com o tema dark da sua Wiki

  useEffect(() => {
    // Libera a tela de splash assim que o layout inicializa
    SplashScreen.hideAsync();
  }, []);

  return (
    <ThemeProvider value={isDarkMode ? DarkTheme : DefaultTheme}>
      <Stack screenOptions={{ headerShown: false }}>
        <Stack.Screen name="index" />
        <Stack.Screen name="cadastro" />
        <Stack.Screen name="home" />
      </Stack>
    </ThemeProvider>
  );
}