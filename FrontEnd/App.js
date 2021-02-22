import { StatusBar } from 'expo-status-bar';
import React from 'react';
import { StyleSheet, Text, View,ImageBackground } from 'react-native';

export default function App() {
  return (
    <View style={styles.container}>

      <View  style={styles.Bcontainer}>

        <ImageBackground
          source={require('./assets/images/image1.jpg')}
          style={styles.image}

          />

        <View style={styles.titles}>


          <Text style={styles.title}>Fitness Time</Text>

          <Text style={styles.subtitle}>Your Virtual Gym Trainer!</Text>





        </View>

   
      </View>
       


      <StatusBar style="auto" />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },

  Bcontainer:{

      width:'100%',
      height:'100%'

  },

  titles:{

      marginTop:'30%',
      width:'100%',
      alignItems:'center',


  },


  title:{

    fontSize:40,
    color:'yellow',
    fontWeight:'bold'
    

  },


  subtitle:{

      fontSize:26,
      color:'lightblue'
    
  },

  image:{

      width:'100%',
      height:'100%',
      resizeMode:'cover',
      position:'absolute',

  },




});
