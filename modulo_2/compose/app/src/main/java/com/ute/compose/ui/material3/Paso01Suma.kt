package com.ute.compose.ui.material3

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Calculate
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.input.ImeAction
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp

@Composable
fun Paso01SumaScreen() {

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp)
            .verticalScroll(rememberScrollState()),
        verticalArrangement = Arrangement.spacedBy(24.dp)
    ) {

        Text(
            text = "Paso 1 · TextField y OutlinedTextField",
            style = MaterialTheme.typography.titleMedium
        )

        HorizontalDivider()

        SumaNumeros()
    }
}

@Composable
private fun SumaNumeros() {

    var numero1 by remember { mutableStateOf("0") }
    var numero2 by remember { mutableStateOf("0") }
    var resultado by remember { mutableStateOf("0") }

    Column(
        verticalArrangement = Arrangement.spacedBy(12.dp)
    ) {

        Text(
            text = "Suma de Dos Números",
            style = MaterialTheme.typography.labelLarge,
            color = MaterialTheme.colorScheme.primary
        )

        // Número 1
        OutlinedTextField(
            value = numero1,
            onValueChange = { numero1 = it },
            label = { Text("Número 1") },
            leadingIcon = {
                Icon(
                    Icons.Default.Calculate,
                    contentDescription = null
                )
            },
            keyboardOptions = KeyboardOptions(
                keyboardType = KeyboardType.Number,
                imeAction = ImeAction.Next
            ),
            singleLine = true,
            modifier = Modifier.fillMaxWidth()
        )

        // Número 2
        OutlinedTextField(
            value = numero2,
            onValueChange = { numero2 = it },
            label = { Text("Número 2") },
            leadingIcon = {
                Icon(
                    Icons.Default.Calculate,
                    contentDescription = null
                )
            },
            keyboardOptions = KeyboardOptions(
                keyboardType = KeyboardType.Number,
                imeAction = ImeAction.Done
            ),
            singleLine = true,
            modifier = Modifier.fillMaxWidth()
        )

        // Botón sumar
        Button(
            onClick = {

                val numero1Int = numero1.toIntOrNull() ?: 0
                val numero2Int = numero2.toIntOrNull() ?: 0

                resultado = (numero1Int + numero2Int).toString()
            },
            modifier = Modifier.fillMaxWidth()
        ) {

            Text(text = "Sumar")
        }

        // Resultado
        Text(
            text = "Resultado: $resultado",
            style = MaterialTheme.typography.bodyLarge
        )
    }
}

@Preview(showBackground = true)
@Composable
fun Paso01SumaPreview() {

    MaterialTheme {
        Paso01SumaScreen()
    }
}