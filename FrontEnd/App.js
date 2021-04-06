import { StatusBar } from 'expo-status-bar';
import React from 'react';
import {Camera} from 'expo-camera'
import { Alert, StyleSheet, Text, TouchableOpacity, View } from 'react-native';


export default function App() {

  return (
    <View style={styles.container}>
      <View style={styles.secondView}>
        <TouchableOpacity 
         onPress={__startCamera}
        style={styles.toucable}>
          <Text style={styles.text}>Take Picture</Text>
        </TouchableOpacity>
       
      </View>
    </View>
  );
}
const [startCamera,setStartCamera] = React.useState(false)

const __startCamera = ()=>{

  const __startCamera = async () => {
    const {status} = await Camera.requestPermissionsAsync()
    if (status === 'granted') {
      // start the camera
      setStartCamera(true)
    } else {
      Alert.alert('Access denied')
    }
  }



}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
  secondView :{
    flex: 1,
    backgroundColor: '#fff',
    justifyContent: 'center',
    alignItems: 'center'

  },
  toucable:{
    width: 130,
    borderRadius: 4,
    backgroundColor: '#14274e',
    flexDirection: 'row',
    justifyContent: 'center',
    alignItems: 'center',
    height: 40
  },
  text:{
    color: '#fff',
    fontWeight: 'bold',
    textAlign: 'center'
  },

});
