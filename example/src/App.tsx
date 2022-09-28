import * as React from 'react';

import { StyleSheet, View, Text, Pressable } from 'react-native';
import { multiply, Video } from 'react-native-videokit2';

export default function App() {
  const [result, setResult] = React.useState<number | undefined>();
const [paused, setPaused] = React.useState(false);
  React.useEffect(() => {
    multiply(3, 7).then(setResult);
  }, []);


  return (
    <View style={styles.container}>
      <Video
        paused={paused}
        source={'https://d3rlna7iyyu8wu.cloudfront.net/skip_armstrong/skip_armstrong_multi_language_subs.m3u8'}
        resizeMode={'contain'}
        style={{ flex: 1}}
      />
      <View style={{flex: 1}}>
        <Pressable onPress={() => setPaused(true)}>
          <Text>Pause</Text>
        </Pressable>
        <Pressable onPress={() => setPaused(false)}>
          <Text>Play</Text>
        </Pressable>
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  box: {
    width: 60,
    height: 60,
    marginVertical: 20,
  },
});
